class AdminController < ApplicationController
  before_filter :need_admin

  #@@order_today_h = Hash::new
  #@@purchase_today_h = Hash::new

  def index
    @total_orders = Order.count
    @total_users = User.count
    @total_merchandises = Merchandise.count

  end

  #def order_today
  #  @order_today = Order.today
  #end

  def order_today

    @order_today_h = Hash::new
    @purchase_today_h = Hash::new

    Order.today.each { |o| @order_today_h.store(o["id"], o["email"]) }

    @order_today_h.each_pair do |key, value|

      line_item_subtotal_a = []

      #抽取key对应的订单（Order）信息
      tmp_o = Order.find_by_id(key)
      order_today_a = [tmp_o.name, tmp_o.address, tmp_o.email, tmp_o.phone, tmp_o.cell_phone,
                       tmp_o.deli_day, tmp_o.deli_time, tmp_o.pay_type]

      #抽取value对应的用户(User)信息
      tmp_u = User.find_by_user_email(value)
      user_info_a = [tmp_u.name]

      #抽取key对应的各项LineItem，将LineItem中的商品id转为商品名
      LineItem.find_all_by_order_id(key).each do |l|

        tmp_m = Merchandise.find_by_id(l["merchandise_id"])
        line_item_a = [tmp_m.merchandise_name, tmp_m.price, l["quantity"], tmp_m.origin]
        line_item_subtotal_a << line_item_a

      end

      @order_today_h[key] = [order_today_a, user_info_a, line_item_subtotal_a]

    end

    purchase_today

    receipt_pdf_maker(@order_today_h)
    purchase_pdf_maker(@purchase_today_h)

  end

  def download_receipt_pdf

    pdf_home = "#{RAILS_ROOT}/pdf/receipt/"
    today_dir = Time.now.strftime("%Y-%m-%d").to_s + "/"
    fname = Time.now.strftime("%Y-%m-%d").to_s + "_" + params[:order_id].to_s + ".pdf"

    file_path = pdf_home + today_dir + fname

    send_file(file_path)

  end

  def download_receipt_pdf_all

  end

  def download_purchase_pdf
    pdf_home = "#{RAILS_ROOT}/pdf/purchase/"
    today_dir = Time.now.strftime("%Y-%m-%d").to_s + "/"
    fname = Time.now.strftime("%Y-%m-%d").to_s + ".pdf"

    file_path = pdf_home + today_dir + fname

    send_file(file_path)

  end

  def check_order
    @order = Order.find(params[:order_id])
    (@order.status == ("" || nil)) ? @order.status = "checked" : @order.status = "completed"

    if @order.save
      # send a "Order has been checked." mail to user.
      #
      redirect_to orders_path, flash[:notice] => "Check mail has been sent."
    else
      redirect_to orders_path, flash[:notice]=> "Check mail could not sent. Try again!"
    end
  end


  def check_today_order
    begin
      Order.today.each do |order|
        (order[:status] == ("" || nil)) ? order[:status] = "checked" : order[:status] = "completed"
        order.save
      end
      redirect_to orders_path, flash[:notice] => "All of check mail has been sent."
    rescue Exception => e
      redirect_to orders_path, flash[:notice]=> "Try again! fail for #{e}"
    end

  end

  def uncheck_today_order
    Order.today.each do |order|
      order[:status] = ""
      order.save
    end
    redirect_to orders_path
  end


  private
  def purchase_today

    @order_today_h.each_value do |value|
      value[2].each do |li|
        if @purchase_today_h.has_key?(li[0])
          @purchase_today_h[li[0]] += li[2]
        else
          @purchase_today_h.store(li[0], li[2])
        end
      end
    end

  end

  def receipt_pdf_maker (order_h)

    logo = "#{RAILS_ROOT}/public/images/clockwise.jpeg"
    today = Time.now.strftime("%Y-%m-%d").to_s + "/"

    pdf_home = "#{RAILS_ROOT}/pdf/receipt/"

    Dir.mkdir(pdf_home+today) unless Dir.exist?(pdf_home+today)

    fname = Time.now.strftime("%Y-%m-%d").to_s

    order_h.each_pair do |key, value|
      user_info = value[0]
      user_name = value[1][0]

      line_item = value[2].map do |v|
        [v[0], v[1], v[2], v[1]*v[2]]
      end

      detail_header = [["Detail"]]
      line_item_head = ["Product name / ID ", "Price", "Quantity", "Sub Total"]

      line_item = line_item.unshift(line_item_head)

      sub_total = ["sub total ", "1000"]
      total = ["total", "5000"]


      Prawn::Document.generate(pdf_home+today+"#{fname+"_"+key.to_s+".pdf"}") do
        font("Helvetica", :size => 10)

        bounding_box([0, cursor], :width => 540, :height => 30) do
          stroke_bounds
          span(540, :position => :center) do
            move_down 5

            font("Courier", :size => 10)
            text "Welcome title fill here < shop name >!", :align => :center
          end
        end


        bounding_box([0, cursor], :width => 540, :height => 600) do

          stroke_bounds

          y = cursor - 10

          bounding_box([10, y], :width => 350, :height => 60) do
            #stroke_bounds
            font("Courier", :size => 12) do
              #text "AREA 1"
              text "user address : #{user_info[1]}"
              text "user name : #{user_name}"
            end
          end
          bounding_box([360, y], :width => 170, :height => 60) do
            #stroke_bounds
            #text "AREA 2"
          end

          y = cursor
          #p y

          bounding_box([10, y], :width => 350, :height => 80) do
            #stroke_bounds
            #text "AREA 3"
            text "Thanks message for shopping .. "
            text "Thanks CCTV .. "
          end
          bounding_box([360, y], :width => 170, :height => 80) do
            #stroke_bounds
            #text "AREA 4"
            font("Courier", :size => 9) do
              text "NET SHOP INFO"
              text "http://www.netshop.com/only-one"
              text "post code : 555001"
              text "shop address : "
              text "tel : 9978010"
              text "shop email : admin@netshop.com "
            end
          end

          #p cursor

          bounding_box([10, cursor], :width => 520, :height => 60) do
            #stroke_bounds
            span(400, :position => :center) do
              #text "AREA 5"
              text "Q&A", :align => :center
              text "http://www.netshop.com/qa", :align => :center
            end
          end

          bounding_box([10, cursor], :width => 520, :height => 80) do
            #stroke_bounds
            #text "AREA 6 "
            table(detail_header, :width => 520)
            table([[user_info[1], key]])
          end

          bounding_box([10, cursor], :width => 520, :height => 200) do
            #stroke_bounds
            text "AREA 7"
            table(line_item, :width => 520)

          end

          y = cursor - 10

          bounding_box([10, y], :width => 350, :height => 100) do
            #stroke_bounds
            text "AREA 8"
          end
          bounding_box([360, y], :width => 170, :height => 100) do
            #stroke_bounds
            text "AREA 9"
            table([]<<sub_total<<sub_total)
            move_down 10
            table([]<<total)
          end
        end

        bounding_box([0, cursor], :width => 540, :height => 90) do
          stroke_bounds
          text "AREA 10"
          image logo, :at=>[5, cursor], :width => 75, :height => 30
          move_down 15
        end

        bounding_box([0, cursor], :width => 150, :height => 15) do
          stroke_bounds
          #text "AREA 11"
          move_down 5
          text "Created day : #{Time.now.strftime("%Y-%m-%d")}"
        end

      end
    end
  end

  def purchase_pdf_maker(purchase_h)

    logo = "#{RAILS_ROOT}/public/images/clockwise.jpeg"
    today_dir = Time.now.strftime("%Y-%m-%d").to_s + "/"

    pdf_home = "#{RAILS_ROOT}/pdf/purchase/"

    Dir.mkdir(pdf_home+today_dir) unless Dir.exist?(pdf_home+today_dir)

    fname = Time.now.strftime("%Y-%m-%d").to_s

    purchase_header = [["Merchandise", "Total quantity", "unit"]]
    purchase_detail = purchase_h.to_a

    Prawn::Document.generate(pdf_home+today_dir+"#{fname+".pdf"}") do
      font("Helvetica", :size => 10)
      bounding_box([0, cursor], :width => 540, :height => 30) do
        stroke_bounds
        span(540, :position => :center) do
          move_down 5

          font("Courier", :size => 10)
          text "Purchase today < #{today_dir}>", :align => :center
        end
      end

      bounding_box([0, cursor], :width => 540, :height => 600) do
        stroke_bounds

        bounding_box([10, cursor-10], :width => 520, :height => 580) do
          #stroke_bounds
          table(purchase_header, :width => 520)
          table(purchase_detail, :width => 520)
        end

      end

      bounding_box([0, cursor], :width => 540, :height => 90) do
        stroke_bounds
        image logo, :at=>[5, cursor], :width => 75, :height => 30
        move_down 15
      end
      bounding_box([0, cursor], :width => 150, :height => 15) do
        stroke_bounds
        move_down 5
        text "Created day : #{today_dir}"
      end
    end
  end

end

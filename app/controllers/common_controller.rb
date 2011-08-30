class CommonController < ApplicationController
  skip_before_filter :need_login

  def about_us
  end

  def security
  end

  def privacy
  end

  def advertise
  end

  def faq
  end

  def sitemap
  end

  def contact
  end

  def promotion
  end

  def news
  end

  def point
  end

  def voucher
  end

  def testimonial
  end

  def affiliate
  end

  def delivery_timetable
    @deli_time = Order::DELI_TIME

    @today_year = Time.now.strftime("%Y")
    @today_month = Time.now.strftime("%m")
    @today_day = Time.now.strftime("%d")

    @today = Time.local(@today_year, @today_month, @today_day)
    @tomorrow = @today.tomorrow
    @day_after_2 = @tomorrow.tomorrow
    @day_after_3 = @day_after_2.tomorrow
    @day_after_4 = @day_after_3.tomorrow
    @day_after_5 = @day_after_4.tomorrow
    @day_after_6 = @day_after_5.tomorrow

    @week =[]<<@today<<@tomorrow<<@day_after_2<<@day_after_3<<@day_after_4<<@day_after_5<<@day_after_6

    render :layout => 'application'

  end

end

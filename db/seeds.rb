# encoding: utf-8

Merchandise.delete_all
User.delete_all
Category.delete_all

Merchandise.create(
    :model_number => '1000000',
    :merchandise_name => 'cucumber',
    :price => '1.5',
    :promoted_price => nil,
    :unit => 'kg',
    :image_url => '/images/cucumber.jpeg',
    :merchandise_detail => 'The cucumber (Cucumis sativus) is a widely cultivated plant in the gourd family Cucurbitaceae, which includes squash, and in the same genus as the muskmelon.',
    :production_month_from => 5,
    :production_month_to => 10,
    :origin => 'LZ',
    :category => "vegetable"
)

Merchandise.create(
    :model_number => '1000001',
    :merchandise_name => 'grape',
    :price => '7.5',
    :promoted_price => nil,
    :unit => 'kg',
    :image_url => '/images/grape.jpeg',
    :merchandise_detail => 'A grape is a non-climacteric fruit, specifically a berry, that grows on the perennial and deciduous woody vines of the genus Vitis.',
    :production_month_from => 4,
    :production_month_to => 9,
    :origin => 'xinjiang',
    :category => "fruit"
)

Merchandise.create(
    :model_number => '1000002',
    :merchandise_name => 'eggplant',
    :price => '3.55',
    :promoted_price => nil,
    :unit => 'kg',
    :image_url => '/images/eggplant.jpeg',
    :merchandise_detail => 'The eggplant, aubergine, melongene, brinjal, or guinea squash (Solanum melongena) is a plant of the family Solanaceae (also known as the nightshades) and genus Solanum. ',
    :production_month_from => 2,
    :production_month_to => 9,
    :origin => 'LZ',
    :category => "vegetable"
)

Merchandise.create(
    :model_number => '1000003',
    :merchandise_name => 'raj',
    :price => '0.05',
    :promoted_price => nil,
    :unit => 'person',
    :image_url => '/images/raj.jpeg',
    :merchandise_detail => 'Raj from The big bang. anglee，valley valley diffigo do dog do dem.',
    :production_month_from => 1,
    :production_month_to => 12,
    :origin => 'india',
    :category => "melon"
)

Merchandise.create(
    :model_number => '1000004',
    :merchandise_name => 'robot',
    :price => '50',
    :promoted_price => '15',
    :unit => 'unit',
    :image_url => '/images/raputa.jpeg',
    :merchandise_detail => 'raputa robot.',
    :production_month_from => 1,
    :production_month_to => 12,
    :origin => 'ghibli',
    :category => "melon"
)

User.create(
    :name => 'admin',
    :hashed_password => 'e418555c5bf355357568ded544e6d6d00b4b85dc4359fe9c583ada399cf2db4f',
    :hashed_address => '8abc3f1ae8f19f72e7585f2df78995dc5d67434a15ca8570aa202b06289d890b',
    :salt => '154394520.4415504349518987 ',
    :role => 'admin',
    :confirm => '1',
    :user_email =>'admin@admin.com',
    :address => 'Lz Chengzhongqu',
    :phone => '280000',
    :cell_phone_1 => '13800000001',
    :cell_phone_2 => '13900000001'
)

User.create(
    :name => 'csl',
    :hashed_password => 'd59f33ba23de3a3b412c2430423474075bdf3a47ea070d7834b7565b47297d98',
    :hashed_address => '8f9e69b75bec85b2d25328b0ba537d22df2e78465e02d88461009de95c862bb0',
    :salt => '155604360.6716108658791249 ',
    :role => 'admin',
    :confirm => '1',
    :user_email =>'csl@csl.com',
    :address => 'LZ Chengzhongqu',
    :phone => '280000',
    :cell_phone_1 => '13800000001',
    :cell_phone_2 => '13900000001'
)

User.create(
    :name => 'rj',
    :hashed_password => '2686d36d67edf29e42beea84977c87d90154cbbd2d39589d23261d9367dcb667',
    :hashed_address => 'f5ab35441078ae68baa658a7c1481a2714ed9ce3c48e9b82ae5f78e11dfbda02',
    :salt => '140587440.2523217140314967',
    :role => 'admin',
    :confirm => '1',
    :user_email =>'rj@rj.com',
    :address => 'LZ Chengzhongqu',
    :phone => '280000',
    :cell_phone_1 => '13800000001',
    :cell_phone_2 => '13900000001'
)

User.create(
    :name => 'rk',
    :hashed_password => '523bef5c367fc575927d6bb2290306dc519adc88fd8f2a593f5db181b0d3ad79',
    :hashed_address => 'aac92d1de1b9dc5cb064761664a23a67e6d20ea5fc844472cd87ba0e5ac8baa1',
    :salt => '135844440.5195132839261811',
    :role => 'admin',
    :confirm => '1',
    :user_email =>'rk@rk.com',
    :address => 'LZ Chengzhongqu',
    :phone => '280000',
    :cell_phone_1 => '13800000001',
    :cell_phone_2 => '13900000001'
)

User.create(
    :name => 'test',
    :hashed_password => '3c3cbafaa0c1b58b1a11abfaa6cf28ec18a08adc12cefca06bc593586fb0866d',
    :hashed_address => '610accf171b57a1d6a5d49b6ae165ec39f2f1a152f978d146f394d36f3be2c9f',
    :salt => '152307120.8997787827558196',
    :role => ' ',
    :confirm => '1',
    :user_email =>'test@test.com',
    :address => 'LZ Chengzhongqu',
    :phone => '280000',
    :cell_phone_1 => '13800000001',
    :cell_phone_2 => '13900000001'
)

User.create(
    :name => '123',
    :hashed_password => 'b406563b6fb8dd271c9987c86eb68fe4641c2a1098f2fdc12ba4162e9124c6d4',
    :hashed_address => 'ba9a805d0c462900f769eab03bec6b2637c410054c30bdd99b4fe44a1f253a9b',
    :salt => '152037600.4276620242522623',
    :role => ' ',
    :confirm => '0',
    :user_email =>'123@123.com',
    :address => 'LZ Chengzhongqu',
    :phone => '280000',
    :cell_phone_1 => '13800000001',
    :cell_phone_2 => '13900000001'
)

Category.create(
    :category => "vegetable"
)

Category.create(
    :category => "melon"
)

Category.create(
    :category => "fruit"
)


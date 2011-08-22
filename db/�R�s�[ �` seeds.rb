# encoding: utf-8

Merchandise.delete_all
User.delete_all

Merchandise.create(
:merchandise_name => 'cucumber',
:price => '1.5',
:image_url => '/images/cucumber.jpeg',
:merchandise_detail =>  'The cucumber (Cucumis sativus) is a widely cultivated plant in the gourd family Cucurbitaceae, which includes squash, and in the same genus as the muskmelon.',
:production_month_from => 5,
:production_month_to => 10,
:origin => 'liuzhou'
)

Merchandise.create(
:merchandise_name => 'grape',
:price => '7.5',
:image_url => '/images/grape.jpeg',
:merchandise_detail =>  'A grape is a non-climacteric fruit, specifically a berry, that grows on the perennial and deciduous woody vines of the genus Vitis.',
:production_month_from => 4,
:production_month_to => 9,
:origin => 'xinjiang'
)

Merchandise.create(
:merchandise_name => 'eggplant',
:price => '3.55',
:image_url => '/images/eggplant.jpeg',
:merchandise_detail =>  'The eggplant, aubergine, melongene, brinjal, or guinea squash (Solanum melongena) is a plant of the family Solanaceae (also known as the nightshades) and genus Solanum. ',
:production_month_from => 2,
:production_month_to => 9,
:origin => 'liuzhou'
)

Merchandise.create(
:merchandise_name => 'raj',
:price => '0.05',
:image_url => '/images/raj.jpeg',
:merchandise_detail =>  'Raj from The big bang. anglee，valley valley diffigo do dog do dem.',
:production_month_from => 1,
:production_month_to => 12,
:origin => 'india'
)

Merchandise.create(
:merchandise_name => 'robot',
:price => '50',
:image_url => '/images/raputa.jpeg',
:merchandise_detail =>  'raputa robot.',
:production_month_from => 1,
:production_month_to => 12,
:origin => 'ghibli'
)

User.create(
:name => 'admin',
:hashed_password => '0f8f5737c73116a1a697d45a9d2c510e8902c6ebbbe37f637cae1ccd8de4422d',
:salt => '119892600.2337039350077632'
)

User.create(
:name => 'test',
:hashed_password => '7e3000a90f8a55e47b1ee1f76e593e1f677b405b5ed9fde17226da97f75405c6',
:salt => '153556080.5168325990796644'
)

User.create(
:name => 'csl@csl.com',
:hashed_password => '1a0100154d3e0c18842d23d404e2b83de2f479ad0484006c2ae383746029d197',
:salt => '153776520.29462815407215426'
)

User.create(
:name => 'rj@rj.com',
:hashed_password => '4f7f7d82f7f49ba12d38a32d12cb58b1cd55a29fb07616cf62b3b0af5640358c',
:salt => '152189160.7799599474187174'
)

User.create(
:name => 'rk@rk.com',
:hashed_password => 'bf4c7b6ae49392d1c4ef6ae6e20575742cfa13b786886252ff62073386b0081d',
:salt => '153775320.5926508907824992'
)

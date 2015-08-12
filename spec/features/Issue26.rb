require 'spec_helper'

feature 'choose your university based on the history' do
	
	scenario 'show history of universities by equivalency' do
		visit 'http://abroad.utt.fr/choix_guide'
		page.should_not has_field 'module1'
		page.should_not has_field 'descModule1'
		click_on 'Historique des universités'
		page.should have_content 'Historique des universités'
		page.should have_content 'Sélectionner une université'
		expect(page).to have_selector 'Continent'
		expect(page).to have_selector 'Pays'
		/page.should have_at_least '1 panel'/
	end
	
	scenario 'submit the university choice' do
		visit 'http://abroad.utt.fr/choix_guide'
		click_on 'Historique des universités'
		$v = 'ETS'; /value to define, we thought about make it dynamic (you click on the button,
		you catch the value returned and you check it out if it's correctly filled in the input text "university name")/
		click_on $v
		find_field("Nom de l'université").value.should eq $v
		page.should has_field 'module1'
		page.should has_field 'descModule1'
	end
	
end

feature 'choose your courses based on the history' do
	
	background 'history of courses' do
		visit 'http://abroad.utt.fr/choix_guide'
		click_on 'Historique des universités'
		click_on 'ETS'
		click_on 'Historique des modules'
	end
	
	scenario 'check out the history' do
		page.should have_content 'Historique des modules'
		page.should have_content 'Sélectionner un module'
		expect(page).to have_content 'Printemps'
		expect(page).to have_content 'Automne'
		/page.should have_at_least '1 panel'/
	end
	
	scenario 'choose a course by clicking' do
		click_on 'course IT455'
		page.should have_content 'IT455'
		find_field("NomModule1").value.should eq 'IT455'
		find_field("descModule1").value.should eq $description; /value brought from database according to the course name/
	end

	scenario 'choose a course by typing' do
		fill_in 'nomModule', :with => 'IT'
		page.should have_content 'IT455'
		page.should have_content 'IT562'
		select 'IT455', :from 'AJAXselection'
		find_field("NomModule1").value.should eq 'IT455'
		find_field("descModule1").value.should eq $description; /value brought from database according to the course name/
	end
	
end

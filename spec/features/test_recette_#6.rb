require 'spec_helper'
 
feature 'Selected choice after the jury #6' do
	
	background 'history of courses' do
		visit 'http://abroad.utt.fr/agreement/125846/'
		click_on '*MGL800* - Gestion de projet en g?nie logiciel'
	end

	scenario 'enter a comment and validate' do
		
		visit 'http://abroad.utt.fr/university/256423/MGL800/'
		fill_in 'Commentaire', :with => 'UV tr?s interessante pour appronfondir la gestion de projet logiciel'
		fill_in 'semestre_depart', :with => 'Automne 2013'

		# Choisir une note de 1 ? 5 (1 ?toile = note_1, 2 ?toile = note_2,etc.)
		#

		click_on 'note_2'
		click_on 'retour_experience_MGL800'
		page.should have_content 'UV tr?s interessante pour appronfondir la gestion de projet logiciel'
		page.should have_content 'note_2'

	end

end
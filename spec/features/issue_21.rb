require 'spec_helper.rb'

feature 'Set course equivalence' do
  
  scenario 'from email' do
    visit'/'
    click_on 'Editer le module'
    fill_in 'Equivalence', :with => 'ISI/MPL/CS/IF05'
    fill_in 'Commentaires', :with => 'Ce cours traite partiellement du contenu d IF05 mais le sujet des méthodes agiles n est pas abordé.'
    click_on 'Enregistrer'
    bookmark = current_url
    visit '/'
    visit bookmark
    page.should have_field 'Equivalence', :with => 'ISI/MPL/CS/IF05'
    page.should have_field 'Commentaires', :with => 'Ce cours traite partiellement du contenu d IF05 mais le sujet des méthodes agiles n est pas abordé.'
  
  end

  scenario 'from home page' do
    visit'/'
    click_on 'Liste des étudiants'
    click_on 'Jean DUPONT'
    click_on 'Editer le module'
    fill_in 'Equivalence', :with => 'ISI/MPL/CS/IF05'
    fill_in 'Commentaires', :with => 'Ce cours traite partiellement du contenu d IF05 mais le sujet des méthodes agiles n est pas abordé.'
    click_on 'Enregistrer'
    bookmark = current_url
    visit '/'
    visit bookmark
    page.should have_field   'Equivalence', :with => 'ISI/MPL/CS/IF05'
    page.should have_content 'Ce cours traite partiellement du contenu d IF05 mais le sujet des méthodes agiles n est pas abordé.'
  
  end
  
  scenario 'with empty Code field' do
    visit '/profile/Jean-DUPONT'
    click_on 'Editer le module'
    fill_in 'Code', :with => ''
    click_on 'Enregistrer'
    bookmark = current_url
    visit bookmark
    page.should have_field 'Erreur', :with => 'Le code de l UV ne doit pas etre vide'
    page.should have_field 'Code', :with => 'GTI510'
 
  end  
  
end  

require 'spec_helper.rb'

feature 'Edit module' do
  
  # Cas ou le responsable de fillière accède à la page d'édition de module via un l'e-mail
  scenario 'from email' do
    visit'/'
    click_on 'Editer le module'
    fill_in 'Equivalence', :with => 'ISI/MPL/CS/IF05'
    fill_in 'Commentaires', :with => 'Ce cours na pas encore été suivi par un étudiant de lUTT une fois sur place.'
    click_on 'Enregistrer'
    bookmark = current_url
    visit '/'
    #page.should_not have_content 'Supercolor-Tryphonar'
    visit bookmark
    page.should have_field 'Equivalence', :with => 'ISI/MPL/CS/IF05'
    page.should have_field 'Commentaires', :with => 'Ce cours na pas encore été suivi par un étudiant de lUTT une fois sur place.'
  
  end
  
  
  # Cas ou le responsable de fillière accède à la page en navigant via l'application
  scenario 'from home page' do
    visit'/'
    click_on 'Liste des étudiants'
    click_on 'Jean DUPONT'
    click_on 'Editer le module'
    fill_in 'Equivalence', :with => 'ISI/MPL/CS/IF05'
    fill_in 'Commentaires', :with => 'Ce cours na pas encore été suivi par un étudiant de lUTT une fois sur place.'
    click_on 'Enregistrer'
    bookmark = current_url
    visit '/'
    visit bookmark
    page.should have_field   'Equivalence', :with => 'ISI/MPL/CS/IF05'
    page.should have_content 'Ce cours na pas encore été suivi par un étudiant de lUTT une fois sur place.'
  
  end
  
  
  # Cas ou on laisse le champ Code vide
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
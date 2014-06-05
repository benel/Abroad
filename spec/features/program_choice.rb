require 'spec_helper'

feature 'Choose a program' do
    
    scenario 'create a program' do
        visit '/'
        click_on 'Consulter la liste des conventions d\'étude'
        click_on 'Créer une nouvelle convention d\étude'
        fill_in 'Nom de l\université', :with => 'Ecole de technologie Supérieure'
        fill_in 'Site Web', :with => 'http://www.etsmtl.com'
        fill_in 'Pays', :with => 'Québec'
        fill_in 'mod1_code', :with => 'MGL800'
        fill_in 'mod1_nom', :with => 'Gestion de projet en génie logiciel'
        fill_in 'mod1_description', :with => 'Projet logiciel'
        click_on 'Valider le choix'
        page.should have_content 'MGL800'
        page.should have_content 'Gestion de projet en génie logiciel'
    end
    
    scenario 'edit a program' do
        visit '/'
        click_on 'Consulter la liste des conventions d\'étude'
        click_on 'consulter_001'
        click_on 'Modifier'
        fill_in 'mod1_code', :with => 'MGL802'
        click_on 'Valider le choix'
        page.should have_content 'MGL802'
    end
    
end
feature 'validation du parcours'

	scenario 'valider l\'UV' do
	  visit 'http://abroad.utt.fr/agreement/125846'
	  click_on 'nom_UV'
	  click_on 'nom_etudiant'
	  click_on 'valider/refuser'
	  click_on 'Imprimer le learning agreement'
	  click_on 'Valider'
	end

	scenario 'refuser l\'UV' do
	  visit 'http://abroad.utt.fr/agreement/125846'
	  click_on 'nom_UV'
	  click_on 'nom_etudiant'
      click_on 'X Commentaires'
	  page.should have_field 'Champs_commentaire', :with => 'Saisir une réponse ...'
	  fill_in 'Champs_commentaire', :with => 'UV similaire validée au semestre dernier.'
	  click_on 'Envoyer'
	  click_on 'Imprimer le learning agreement'
	  click_on 'Valider'
	end


	scenario 'edition d\'un module de cours' do
	  visit 'http://abroad.utt.fr/agreement/125846'
	  click_on 'Editer'
	  page.should have_field 'Equivalence'
	  page.should have_field 'Commentaires'
	  fill_in 'Equivalence', :with => 'ISI/MPL/CS/IF05'
	  fill_in 'Commentaires', :with => 'Ce cours n\'a pas été suivi par un étudiant de l\'UTT une fois sur place'
	  click_on 'Confirmer l\'envoi'
	end

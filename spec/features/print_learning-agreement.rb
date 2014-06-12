require 'spec_helper.rb'

feature 'Print learning agreement' do
    
        background do
                # Should fill a minimal learning agreement to test
        end

        scenario 'Test return button and page content' do
                visit '/'
                click_on 'Consulter la liste des conventions d\'étude'
                # The next line selects the row of the table listing learning agreements containing the Text 'Jean Dupond' and clicks on the button 'Consulter' in the same row. It uses XPath syntax.
                find(:xpath, "//tr[td[contains(.,'Jean Dupond')]]/td/input", :value => 'Consulter').click
		
                click_on 'Imprimer le learning agreement'
                
		# Test page content
                page.should have_content 'MGL800'
                page.should have_content 'TAUN14'
		
		test_count('input', 0)

                page.should have_no_content 'commentaire'
        end
end

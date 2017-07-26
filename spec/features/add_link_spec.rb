feature 'Adding new link' do

  scenario 'Add a new link' do
    visit('/links/new')
    fill_in 'title', with: 'Sasso Carta Forbici'
    fill_in 'url', with: 'https://sasso-carta-forbici.herokuapp.com'
    click_button 'Create link'
    
    expect(page).to have_content('Sasso Carta Forbici')
  end

end

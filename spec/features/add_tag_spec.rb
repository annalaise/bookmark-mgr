feature 'Adding tag' do

  scenario 'Add a tag to a link' do
    visit('/links/new')
    fill_in 'title', with: 'Sasso Carta Forbici'
    fill_in 'url', with: 'https://sasso-carta-forbici.herokuapp.com'
    fill_in 'tags', with: 'education'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include ('education')
  end
  
end

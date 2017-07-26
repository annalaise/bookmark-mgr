feature 'Adding tag' do

  scenario 'Add a tag to a link' do
    visit('/links/new')
    fill_in 'title', with: 'Sasso Carta Forbici'
    fill_in 'url', with: 'https://sasso-carta-forbici.herokuapp.com'
    fill_in 'tags', with: 'education'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

  scenario 'I can add multiple tags to a new link' do
    visit('/links/new')
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://makersacademy.com'
    fill_in 'tags', with: 'education ruby'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end

end

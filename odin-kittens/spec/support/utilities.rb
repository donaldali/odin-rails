def fill_form
	fill_in 'Name', with: 'fluffy'
	fill_in 'Age',  with: 3
end

def fill_form_incorrectly
	fill_in 'Name', with: ''
	fill_in 'Age',  with: 3
end

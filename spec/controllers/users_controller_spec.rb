require 'spec_helper'

describe UsersController do

	# minimal set of attributes to create a valid user
	let(:valid_attributes) { {
			"first_name" => "FirstName"
			"last_name" => "LastName"
			"email" => "email@example.com"
			"password" => "password123"
			"password_confirmation" => "password123"
		} }

end

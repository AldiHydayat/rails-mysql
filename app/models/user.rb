class User < ApplicationRecord
	has_one :wallet

	validates :name, presence: {message: 'Nama tidak boleh kosong'}
	validates :username, :presence => { message: 'Username tidak boleh kosong' }, :uniqueness => true
	validates :password, :presence => { message: 'Nama tidak boleh kosong' }

	has_secure_password
end

class Account::BaseController < ApplicationController

  layout 'account'

  before_action :authenticate_user!

end
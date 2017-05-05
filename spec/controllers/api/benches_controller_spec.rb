require 'rails_helper'

RSpec.describe Api::BenchesController, type: :controller do

  describe 'GET #index' do
    render_views
    # Without the above directive, response.body would only be an empty string.

  end
  
end

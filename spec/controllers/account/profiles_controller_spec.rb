require 'rails_helper'

RSpec.describe Account::ProfilesController, type: :controller do

  render_views

  # Actions
  # ------------------------------------------------------------------
  describe '#actions' do
    # HTML
    # ----------------------------------------------------------------
    context '#html' do
      # for authenticated user
      # --------------------------------------------------------------
      context 'for authenticated user' do
        login_user
        # GET #show
        # ------------------------------------------------------------
        describe 'GET #show' do
          it 'assigns the requested profile as @profile' do
            get :show
            expect(assigns(:profile)).to eq(@user.profile)
          end

          it 'responds with status 200' do
            get :show
            expect(response).to have_http_status(200)
          end
        end
      end

      # for unauthenticated user
      # --------------------------------------------------------------
      context 'for unauthenticated user' do
        # GET #show
        # ------------------------------------------------------------
        describe 'GET #show' do
          it 'redirects to sign in' do
            get :show
            expect(response).to redirect_to new_user_session_path
          end

          it 'responds with status 302' do
            get :show
            expect(response).to have_http_status(302)
          end
        end
      end
    end

    # JSON
    # ----------------------------------------------------------------
    context '#json' do
      # for authenticated user
      # --------------------------------------------------------------
      context 'for authenticated user' do
        login_user
        # GET #show
        # ------------------------------------------------------------
        describe 'GET #show' do
          it 'assigns the requested profile as @profile' do
            get :show
            expect(assigns(:profile)).to eq(@user.profile)
          end

          it 'responds with status 200' do
            get :show, format: :json
            expect(response).to have_http_status(200)
          end
        end
      end

      # for unauthenticated user
      # --------------------------------------------------------------
      context 'for unauthenticated user' do
        # GET #show
        # ------------------------------------------------------------
        describe 'GET #show' do
          it 'responds with status 401' do
            get :show, format: :json
            expect(response).to have_http_status(401)
          end
        end
      end
    end
  end
end

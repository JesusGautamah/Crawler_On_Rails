class ApplicationController < ActionController::Base
    include Pagy::Backend
    include ActionController::Helpers
end

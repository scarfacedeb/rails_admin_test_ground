# frozen_string_literal: true

RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.included_models = ['Cms::Page', 'Cms::Page::Translation', 'Comment']

  config.model 'Cms::Page' do
    configure :preview, :active_storage
    configure :translations, :globalize_tabs do
      build_if_missing true
    end
    include_fields :slug, :preview, :translations, :comments
  end

  config.model 'Cms::Page::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    configure :image, :active_storage
    include_fields :locale, :title, :content, :image
  end
end

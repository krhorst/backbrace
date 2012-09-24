require 'rails/generators'
require "backbrace/version"
require "backbrace/resource_helpers"

module Backbrace
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Backbrace::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)

      desc "This generator installs a quickstart file structure app/assets/javascripts/app"

      class_option :skip_git, :type => :boolean, :aliases => "-G", :default => false,
                   :desc => "Skip Git ignores and keeps"

      def inject_backbone
        inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
          "//= require underscore\n//= require backbone\n//= require signals\n//= require crossroads\n//= require app/app.js\n//= require app/app.models\n//= require app/app.components\n//= require app/app.views\n//= require app/app.helpers\n//= require_tree ./app/models\n//= require_tree ./app/models\n//= require_tree ./app/components\n//= require_tree ./app/views\n//= require app/app.router\n//= require app/init\n"
        end
      end

      def create_dir_layout
        %W{components models views}.each do |dir|
          empty_directory "app/assets/javascripts/app/#{dir}"
          create_file "app/assets/javascripts/app/#{dir}/.gitkeep" unless options[:skip_git]
        end
      end

      def create_app_files
        template "init.js", "app/assets/javascripts/app/init.js"
        template "app.js", "app/assets/javascripts/app/app.js"
        template "app.components.js", "app/assets/javascripts/app/app.components.js"
        template "app.helpers.js", "app/assets/javascripts/app/app.helpers.js"
        template "app.models.js", "app/assets/javascripts/app/app.models.js"
        template "app.router.js", "app/assets/javascripts/app/app.router.js"
        template "app.views.js", "app/assets/javascripts/app/app.views.js"
      end

    end
  end

    module Rails
      class Engine < ::Rails::Engine
      end
    end


end


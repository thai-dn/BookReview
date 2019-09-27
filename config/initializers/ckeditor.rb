# frozen_string_literal: true

# Use this hook to configure ckeditor
Ckeditor.setup do |config|
  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default), :mongo_mapper and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require 'ckeditor/orm/active_record'
  config.cdn_url = '//cdn.ckeditor.com/4.11.3/standard/ckeditor.js'

end

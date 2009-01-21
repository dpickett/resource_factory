Dir.glob(
  File.join(File.dirname(__FILE__), 'resource_factory', '**/*.rb')
).each do |f|
  require f
end
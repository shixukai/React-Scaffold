require_relative "RsScaffold"
require 'optparse'

options = {}
args = {}
OptionParser.new do |opts|
  opts.banner = "Usage: rsca ComponentName [path:optional]"
  # opts.on("--destination=path", "destination path") do |d|
  #   args[:destination] = d
  # end
end.parse!

comp_name = ARGV[0]
dest_path = ARGV[1] || './'

if !comp_name
  puts 'component name is required'
  exit
end

# files_name = ['Template/Template.js', 'Template/styles.scss', 'Template/index.js']
RsScaffold.sub_and_copy('Template/components/Template.js', dest_path, 'Template', comp_name, comp_name + '.js')
RsScaffold.sub_and_copy('Template/components/index.js', dest_path, 'Template', comp_name)
RsScaffold.sub_and_copy('Template/components/styles.scss', dest_path, 'Template', comp_name)

puts "组件创建成功 : #{File.join(dest_path, comp_name)}"

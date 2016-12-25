#component scaffold
require_relative "RsScaffold"
require 'optparse'

options = {}
args = {}
OptionParser.new do |opts|
  opts.banner = "Usage: rsca ComponentName [path:optional]"
  options[:component] = false
  options[:action] = false

  opts.on("-c", "component scaffold") do
    options[:component] = true
  end

  opts.on("-a", "action scaffold") do
    options[:action] = true
  end
end.parse!



def create_component
  comp_name = ARGV[0]
  dest_dir = ARGV[1] || './'

  if !comp_name
    puts 'component name is required'
    exit
  end

  # files_name = ['Template/Template.js', 'Template/styles.scss', 'Template/index.js']
  RsScaffold.comp_sub_and_copy('Template/components/Template.js', dest_dir, 'Template', comp_name, comp_name + '.js')
  RsScaffold.comp_sub_and_copy('Template/components/index.js', dest_dir, 'Template', comp_name)
  RsScaffold.comp_sub_and_copy('Template/components/styles.scss', dest_dir, 'Template', comp_name)
end

def create_action
  action_name = ARGV[0]
  dest_dir = ARGV[1] || './'

  if !action_name
    puts 'action name is required'
    exit
  end

  RsScaffold.action_sub_and_copy('Template/actions/Template.js', dest_dir, action_name + 'Actions.js')
end

if  options[:component]
  create_component
elsif options[:action]
  create_action
end

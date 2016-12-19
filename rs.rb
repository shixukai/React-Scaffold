require_relative "RsScaffold"

comp_name = ARGV[0]
dest_path = ARGV[1] || './'
exit false if !comp_name

# files_name = ['Template/Template.js', 'Template/styles.scss', 'Template/index.js']
RsScaffold.sub_and_copy('Template/Template.js', dest_path, 'Template', comp_name, comp_name + '.js')
RsScaffold.sub_and_copy('Template/index.js', dest_path, 'Template', comp_name)
RsScaffold.sub_and_copy('Template/styles.scss', dest_path, 'Template', comp_name)

puts "dest_path: #{dest_path}"

require 'fileutils'

class RsScaffold
  def self.sub_and_copy (source_file, dest_path, old_comp_name, new_comp_name, new_file_name = nil)
    file_path_main = File.join(File.dirname(__FILE__), source_file)

    #如果没有传入新文件名，则用原来的文件名
    new_file_name = File.basename(file_path_main) if !new_file_name

    context = File.read(file_path_main)
    new_context = context.gsub(old_comp_name, new_comp_name)

    new_file_dir = File.join(dest_path, new_comp_name)
    FileUtils.mkdir_p(new_file_dir) unless File.exists?(new_file_dir)

    new_file_path = File.join(new_file_dir, new_file_name)

    new_file = File.open(new_file_path, 'w') do |file|
      file.puts(new_context)
      file.close()
    end
  end
end

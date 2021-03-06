require 'fileutils'

class RsScaffold
  # scaffold component
  #参数依次为：模版名称，目标路径， 模板中的组件名称，新的组件名称，新的文件名（可选）
  def self.comp_sub_and_copy (template_file, dest_dir, old_comp_name, new_comp_name, new_file_name = nil)
    template_file_path = File.join(File.dirname(__FILE__), template_file)

    #如果没有传入新文件名，则用原来的文件名
    new_file_name = File.basename(template_file_path) if !new_file_name

    template_context = File.read(template_file_path)
    new_context = template_context.gsub(old_comp_name, new_comp_name)


    if dest_dir != './' && !File.exists?(dest_dir)
      #目标路径不存在，退出
      puts "#{new_file_name}创建失败, #{dest_dir}不存在"
      return
    end

    new_file_dir = File.join(dest_dir, new_comp_name)

    FileUtils.mkdir_p(new_file_dir) if !File.exists?(new_file_dir)

    new_file_path = File.join(new_file_dir, new_file_name)

    if File.exists?(new_file_path)
      #如果文件已存在，退出
      puts "创建失败, #{new_file_path}该文件已存在"
      return
    end

    new_file = File.open(new_file_path, 'w') do |file|
      file.puts(new_context)
      file.close()
    end

    puts "创建成功 : #{new_file_path}"
  end

  # scaffold actions
  def self.action_sub_and_copy (template_file, dest_dir, action_name, replace_params = {})
    template_file_path = File.join(File.dirname(__FILE__), template_file)
    new_file_path = File.join(dest_dir, action_name)

    if !File.exists?(dest_dir)
      #目标路径不存在，退出
      puts "创建失败, #{dest_dir}不存在"
      return
    end

    if File.exists?(new_file_path)
      #如果文件存在，退出
      puts "创建失败, #{new_file_path}该文件已存在"
      return
    end

    template_context = File.read(template_file_path)
    new_context = template_context
    # .gsub(old_comp_name, new_comp_name)

    new_file = File.open(new_file_path, 'w') do |file|
      file.puts(new_context)
      file.close()
    end
    # puts new_file_path
    # puts template_context
    puts "创建成功 : #{new_file_path}"

    add_to_action_index(dest_dir, action_name, 'index.js')
  end

private
  def self.add_to_action_index (dest_dir, action_name, index_file_name)
    index_file_path = File.join(dest_dir, index_file_name)

    export_content = "export * as #{action_name.gsub('.js', '')} from './#{action_name.gsub('.js', '')}';"

    new_file = File.open(index_file_path, 'a') do |file|
      file.puts(export_content)
      file.close()
    end

    puts "加入index成功"
  end
end

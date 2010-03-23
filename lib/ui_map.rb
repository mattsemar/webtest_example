class UIMapBase

  def initialize()
    eval File.read(  File.join(ROOT, "ui_maps", "defaults.rb") )
  end


  def method_missing(method, *args)
    if args.length > 0
      # #puts "delegating to super class #{args}"
      super(method, args)
    else
      instance_variable_get("@#{method.to_s}")
    end
  end

  def to_s
    ret = ""
    instance_variables.each do |iv|
      ret << iv << "= " << instance_variable_get(iv).to_s << "\n"
    end
    ret
  end
end


class UIMap < UIMapBase
  def initialize(options = {})
    super()
    client_name = options[:client_name]
    if client_name
      fname =  File.join(ROOT, "ui_maps", "#{client_name}.rb")
      eval File.read(fname)
    else
      $logger.warn "Could not find #{client_name}"
    end

  end

end

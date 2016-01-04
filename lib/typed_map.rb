require "typed_map/version"

class TypedMap
  attr_reader :ktype, :vtype

  INTERFACE_METHOD_NAMES = %i[add keys [] has? count length to_a to_h].freeze

  class << self
    def interface_method_names
      INTERFACE_METHOD_NAMES
    end
  end

  def initialize(ktype:, vtype:)
    raise ArgumentError, "'ktype' should be an instance of Class" unless ktype.instance_of?(Class)
    raise ArgumentError, "'vtype' should be an instance of Class" unless vtype.instance_of?(Class)

    @ktype = ktype
    @vtype = vtype

    @map = {}
  end

  def add(k, v)
    raise ArgumentError, "'k' should be an instance of #{ktype}" unless k.instance_of?(ktype)
    raise ArgumentError, "'v' should be an instance of #{vtype}" unless v.instance_of?(vtype)
    raise ArgumentError, "key '#{k}' already exists"             if has?(k)

    @map[k] = v
  end

  def keys
    @map.keys
  end

  def [](k)
    raise ArgumentError, "'k' should be an instance of #{ktype}" unless k.instance_of?(ktype)
    raise ArgumentError, "key '#{k}' not exists"                 unless has?(k)

    @map[k]
  end

  def has?(k)
    raise ArgumentError, "'k' should be an instance of #{ktype}" unless k.instance_of?(ktype)

    @map.has_key? k
  end

  def count
    @map.count
  end

  alias :length :count

  def to_a
    @map.to_a
  end

  def to_h
    @map.dup
  end
end

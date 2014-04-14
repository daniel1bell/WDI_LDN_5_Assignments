class DBBase

  attr_accessor :id

  def self.attributes(attrs)
    @attributes = attrs
    attrs.keys.each do |attr|
      attr_accessor attr
    end
  end

  def self.get_attributes
    @attributes
  end

  def attributes
    self.class.get_attributes
  end

  def self.table_name
    raise("TableName not defined for model `#{self.name}`")
  end

  def table_name
    self.class.table_name
  end  

  def self.run_sql(sql)
    conn = PG.connect(dbname: 'stockbook', host: 'localhost')
    result = conn.exec(sql)
    conn.close
    result
  end

  def run_sql(sql)
    self.class.run_sql(sql)
  end

  def self.all
    results = run_sql("select * from #{table_name}")
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    result = run_sql("select * from #{table_name} where id = #{id.to_i}").first
    self.new(result) if result
  end

  def save
    if id.nil?
      sql_fields = []
      sql_values = []
      attributes.each do |attribute, type|
        sql_fields << attribute
        sql_values << sql_sanitize(self.send(attribute), type)
      end

      sql = "insert into #{table_name} (#{sql_fields.join(', ')}) values (#{sql_values.join(', ')}) returning id"
      self.id = run_sql(sql).first['id']

    else

      sql_fields_and_values = attributes.map do |attribute, type|
        "#{attribute} = #{sql_sanitize(self.send(attribute), type)}"
      end

      sql = "update #{table_name} set #{sql_fields_and_values.join(', ')} where id = #{sql_sanitize(id, :integer)}"
      run_sql(sql)
    end

  end

  def update_attributes(attrs)
    attrs.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    save
  end

  def destroy
    run_sql("delete from #{table_name} where id = #{id}")
  end

  def sql_sanitize(value, type)
    case type
      when :string
        "'#{value.to_s.gsub("'", "''")}'"
      when :text
        "'#{value.to_s.gsub("'", "''")}'"
      when :integer
        value.to_i
      when :decimal
        value.to_f
      else
        raise "Unrecognised data type `#{type}`"
    end
  end


end
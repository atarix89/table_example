class MigrateDB1 < ActiveRecord::Migration
  def connection
    ActiveRecord::Base.establish_connection("data#data1").connection
  end

  def change
    # your code goes here.
  end
end

class MigrateDB2 < ActiveRecord::Migration
  def connection
    ActiveRecord::Base.establish_connection("data#data2").connection
  end

  def change
    # your code goes here.
  end
end

class MigrateDB3 < ActiveRecord::Migration
  def connection
    ActiveRecord::Base.establish_connection("data#data3").connection
  end

  def change
    # your code goes here.
  end
end
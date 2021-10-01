class PublishDateValidator < ActiveModel::Validator
    
    def validate(record)
      if record.publish_date && record.publish_date > Date.today
        record.errors[:base] << "Publish Date Invalid"
      end
    end


end
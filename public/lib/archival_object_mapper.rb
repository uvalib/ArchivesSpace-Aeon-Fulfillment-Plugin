class ArchivalObjectMapper < RecordMapper
    
    def initialize(archival_object)
        super(archival_object)
    end


    # Override for RecordMapper json_fields method. 
    def json_fields
        mappings = super

        json = self.record.json
        if !json
            return mappings
        end 

        if json['repository_processing_note'] && !json['repository_processing_note'].blank?
            mappings['repository_processing_note'] = json['repository_processing_note']
        end

        return mappings
    end


    # Returns a hash that maps from Aeon OpenURL values to values in the provided record.
    def map
        mappings = super

        mappings['component_id'] = self.record['component_id']


        return mappings
    end
end

class TransferCourse
  include Mongoid::Document

  belongs_to :transfer_school
  field :subject, type: String # TRNS_CRSE_SUBJ
  field :number, type: Integer # TRNS_CRSE_NUMB
  field :title, type: String # TRNS_TITLE

  # TODO: Verify whether an external course can map to more than one Biola course
  field :biola_course_subject, type: String # BIOLA_CRSE_SUBJ
  field :biola_course_number, type: Integer # BIOLA_CRSE_NUMB
  field :biola_course_title, type: String # BIOLA_TITLE

end

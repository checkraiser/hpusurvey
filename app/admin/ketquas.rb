ActiveAdmin.register Ketqua do
 index do
    selectable_column
    id_column
    column :sinhvien_id
    column :answer_id
    column :answer_text    
    default_actions
  end
  filter :sinhvien_id
  filter :answer_id
end

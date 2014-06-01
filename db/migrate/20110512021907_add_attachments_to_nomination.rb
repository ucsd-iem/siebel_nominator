class AddAttachmentsToNomination < ActiveRecord::Migration
  def self.up
    add_column :nominations, :nominator_letter_file_name, :string
    add_column :nominations, :nominator_letter_content_type, :string
    add_column :nominations, :nominator_letter_file_size, :integer
    add_column :nominations, :nominator_letter_updated_at, :datetime
    add_column :nominations, :nominee_resume_file_name, :string
    add_column :nominations, :nominee_resume_content_type, :string
    add_column :nominations, :nominee_resume_file_size, :integer
    add_column :nominations, :nominee_resume_updated_at, :datetime
    add_column :nominations, :nominee_portrait_file_name, :string
    add_column :nominations, :nominee_portrait_content_type, :string
    add_column :nominations, :nominee_portrait_file_size, :integer
    add_column :nominations, :nominee_portrait_updated_at, :datetime
    add_column :nominations, :nominee_transcript_file_name, :string
    add_column :nominations, :nominee_transcript_content_type, :string
    add_column :nominations, :nominee_transcript_file_size, :integer
    add_column :nominations, :nominee_transcript_updated_at, :datetime
    add_column :nominations, :nominee_statement_file_name, :string
    add_column :nominations, :nominee_statement_content_type, :string
    add_column :nominations, :nominee_statement_file_size, :integer
    add_column :nominations, :nominee_statement_updated_at, :datetime
    add_column :nominations, :misc_document_file_name, :string
    add_column :nominations, :misc_document_content_type, :string
    add_column :nominations, :misc_document_file_size, :integer
    add_column :nominations, :misc_document_updated_at, :datetime
  end

  def self.down
    remove_column :nominations, :nominator_letter_file_name
    remove_column :nominations, :nominator_letter_content_type
    remove_column :nominations, :nominator_letter_file_size
    remove_column :nominations, :nominator_letter_updated_at
    remove_column :nominations, :nominee_resume_file_name
    remove_column :nominations, :nominee_resume_content_type
    remove_column :nominations, :nominee_resume_file_size
    remove_column :nominations, :nominee_resume_updated_at
    remove_column :nominations, :nominee_portrait_file_name
    remove_column :nominations, :nominee_portrait_content_type
    remove_column :nominations, :nominee_portrait_file_size
    remove_column :nominations, :nominee_portrait_updated_at
    remove_column :nominations, :nominee_transcript_file_name
    remove_column :nominations, :nominee_transcript_content_type
    remove_column :nominations, :nominee_transcript_file_size
    remove_column :nominations, :nominee_transcript_updated_at
    remove_column :nominations, :nominee_statement_file_name
    remove_column :nominations, :nominee_statement_content_type
    remove_column :nominations, :nominee_statement_file_size
    remove_column :nominations, :nominee_statement_updated_at
    remove_column :nominations, :misc_document_file_name
    remove_column :nominations, :misc_document_content_type
    remove_column :nominations, :misc_document_file_size
    remove_column :nominations, :misc_document_updated_at
  end
end

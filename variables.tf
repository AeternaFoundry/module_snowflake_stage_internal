variable "stage_internals" {
  description = <<EOT
Map of stage_internals, attributes below
Required:
    - database
    - name
    - schema
Optional:
    - comment
    - directory (block):
        - auto_refresh (optional)
        - enable (required)
    - encryption (block):
        - snowflake_full (optional, block):
        - snowflake_sse (optional, block):
    - file_format (block):
        - avro (optional, block):
            - compression (optional)
            - null_if (optional)
            - replace_invalid_characters (optional)
            - trim_space (optional)
        - csv (optional, block):
            - binary_format (optional)
            - compression (optional)
            - date_format (optional)
            - empty_field_as_null (optional)
            - encoding (optional)
            - error_on_column_count_mismatch (optional)
            - escape (optional)
            - escape_unenclosed_field (optional)
            - field_delimiter (optional)
            - field_optionally_enclosed_by (optional)
            - file_extension (optional)
            - multi_line (optional)
            - null_if (optional)
            - parse_header (optional)
            - record_delimiter (optional)
            - replace_invalid_characters (optional)
            - skip_blank_lines (optional)
            - skip_byte_order_mark (optional)
            - skip_header (optional)
            - time_format (optional)
            - timestamp_format (optional)
            - trim_space (optional)
        - format_name (optional)
        - json (optional, block):
            - allow_duplicate (optional)
            - binary_format (optional)
            - compression (optional)
            - date_format (optional)
            - enable_octal (optional)
            - file_extension (optional)
            - ignore_utf8_errors (optional)
            - multi_line (optional)
            - null_if (optional)
            - replace_invalid_characters (optional)
            - skip_byte_order_mark (optional)
            - strip_null_values (optional)
            - strip_outer_array (optional)
            - time_format (optional)
            - timestamp_format (optional)
            - trim_space (optional)
        - orc (optional, block):
            - null_if (optional)
            - replace_invalid_characters (optional)
            - trim_space (optional)
        - parquet (optional, block):
            - binary_as_text (optional)
            - compression (optional)
            - null_if (optional)
            - replace_invalid_characters (optional)
            - trim_space (optional)
            - use_logical_type (optional)
            - use_vectorized_scanner (optional)
        - xml (optional, block):
            - compression (optional)
            - disable_auto_convert (optional)
            - ignore_utf8_errors (optional)
            - preserve_space (optional)
            - replace_invalid_characters (optional)
            - skip_byte_order_mark (optional)
            - strip_outer_element (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    database = string
    name     = string
    schema   = string
    comment  = optional(string)
    directory = optional(object({
      auto_refresh = optional(string)
      enable       = bool
    }))
    encryption = optional(object({
      snowflake_full = optional(object({
      }))
      snowflake_sse = optional(object({
      }))
    }))
    file_format = optional(object({
      avro = optional(object({
        compression                = optional(string)
        null_if                    = optional(list(string))
        replace_invalid_characters = optional(string)
        trim_space                 = optional(string)
      }))
      csv = optional(object({
        binary_format                  = optional(string)
        compression                    = optional(string)
        date_format                    = optional(string)
        empty_field_as_null            = optional(string)
        encoding                       = optional(string)
        error_on_column_count_mismatch = optional(string)
        escape                         = optional(string)
        escape_unenclosed_field        = optional(string)
        field_delimiter                = optional(string)
        field_optionally_enclosed_by   = optional(string)
        file_extension                 = optional(string)
        multi_line                     = optional(string)
        null_if                        = optional(list(string))
        parse_header                   = optional(string)
        record_delimiter               = optional(string)
        replace_invalid_characters     = optional(string)
        skip_blank_lines               = optional(string)
        skip_byte_order_mark           = optional(string)
        skip_header                    = optional(number)
        time_format                    = optional(string)
        timestamp_format               = optional(string)
        trim_space                     = optional(string)
      }))
      format_name = optional(string)
      json = optional(object({
        allow_duplicate            = optional(string)
        binary_format              = optional(string)
        compression                = optional(string)
        date_format                = optional(string)
        enable_octal               = optional(string)
        file_extension             = optional(string)
        ignore_utf8_errors         = optional(string)
        multi_line                 = optional(string)
        null_if                    = optional(list(string))
        replace_invalid_characters = optional(string)
        skip_byte_order_mark       = optional(string)
        strip_null_values          = optional(string)
        strip_outer_array          = optional(string)
        time_format                = optional(string)
        timestamp_format           = optional(string)
        trim_space                 = optional(string)
      }))
      orc = optional(object({
        null_if                    = optional(list(string))
        replace_invalid_characters = optional(string)
        trim_space                 = optional(string)
      }))
      parquet = optional(object({
        binary_as_text             = optional(string)
        compression                = optional(string)
        null_if                    = optional(list(string))
        replace_invalid_characters = optional(string)
        trim_space                 = optional(string)
        use_logical_type           = optional(string)
        use_vectorized_scanner     = optional(string)
      }))
      xml = optional(object({
        compression                = optional(string)
        disable_auto_convert       = optional(string)
        ignore_utf8_errors         = optional(string)
        preserve_space             = optional(string)
        replace_invalid_characters = optional(string)
        skip_byte_order_mark       = optional(string)
        strip_outer_element        = optional(string)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
}


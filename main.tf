resource "snowflake_stage_internal" "stage_internals" {
  for_each = var.stage_internals

  database = each.value.database
  name     = each.value.name
  schema   = each.value.schema
  comment  = each.value.comment

  dynamic "directory" {
    for_each = each.value.directory != null ? [each.value.directory] : []
    content {
      auto_refresh = directory.value.auto_refresh
      enable       = directory.value.enable
    }
  }

  dynamic "encryption" {
    for_each = each.value.encryption != null ? [each.value.encryption] : []
    content {
      dynamic "snowflake_full" {
        for_each = encryption.value.snowflake_full != null ? [encryption.value.snowflake_full] : []
        content {
        }
      }
      dynamic "snowflake_sse" {
        for_each = encryption.value.snowflake_sse != null ? [encryption.value.snowflake_sse] : []
        content {
        }
      }
    }
  }

  dynamic "file_format" {
    for_each = each.value.file_format != null ? [each.value.file_format] : []
    content {
      dynamic "avro" {
        for_each = file_format.value.avro != null ? [file_format.value.avro] : []
        content {
          compression                = avro.value.compression
          null_if                    = avro.value.null_if
          replace_invalid_characters = avro.value.replace_invalid_characters
          trim_space                 = avro.value.trim_space
        }
      }
      dynamic "csv" {
        for_each = file_format.value.csv != null ? [file_format.value.csv] : []
        content {
          binary_format                  = csv.value.binary_format
          compression                    = csv.value.compression
          date_format                    = csv.value.date_format
          empty_field_as_null            = csv.value.empty_field_as_null
          encoding                       = csv.value.encoding
          error_on_column_count_mismatch = csv.value.error_on_column_count_mismatch
          escape                         = csv.value.escape
          escape_unenclosed_field        = csv.value.escape_unenclosed_field
          field_delimiter                = csv.value.field_delimiter
          field_optionally_enclosed_by   = csv.value.field_optionally_enclosed_by
          file_extension                 = csv.value.file_extension
          multi_line                     = csv.value.multi_line
          null_if                        = csv.value.null_if
          parse_header                   = csv.value.parse_header
          record_delimiter               = csv.value.record_delimiter
          replace_invalid_characters     = csv.value.replace_invalid_characters
          skip_blank_lines               = csv.value.skip_blank_lines
          skip_byte_order_mark           = csv.value.skip_byte_order_mark
          skip_header                    = csv.value.skip_header
          time_format                    = csv.value.time_format
          timestamp_format               = csv.value.timestamp_format
          trim_space                     = csv.value.trim_space
        }
      }
      format_name = file_format.value.format_name
      dynamic "json" {
        for_each = file_format.value.json != null ? [file_format.value.json] : []
        content {
          allow_duplicate            = json.value.allow_duplicate
          binary_format              = json.value.binary_format
          compression                = json.value.compression
          date_format                = json.value.date_format
          enable_octal               = json.value.enable_octal
          file_extension             = json.value.file_extension
          ignore_utf8_errors         = json.value.ignore_utf8_errors
          multi_line                 = json.value.multi_line
          null_if                    = json.value.null_if
          replace_invalid_characters = json.value.replace_invalid_characters
          skip_byte_order_mark       = json.value.skip_byte_order_mark
          strip_null_values          = json.value.strip_null_values
          strip_outer_array          = json.value.strip_outer_array
          time_format                = json.value.time_format
          timestamp_format           = json.value.timestamp_format
          trim_space                 = json.value.trim_space
        }
      }
      dynamic "orc" {
        for_each = file_format.value.orc != null ? [file_format.value.orc] : []
        content {
          null_if                    = orc.value.null_if
          replace_invalid_characters = orc.value.replace_invalid_characters
          trim_space                 = orc.value.trim_space
        }
      }
      dynamic "parquet" {
        for_each = file_format.value.parquet != null ? [file_format.value.parquet] : []
        content {
          binary_as_text             = parquet.value.binary_as_text
          compression                = parquet.value.compression
          null_if                    = parquet.value.null_if
          replace_invalid_characters = parquet.value.replace_invalid_characters
          trim_space                 = parquet.value.trim_space
          use_logical_type           = parquet.value.use_logical_type
          use_vectorized_scanner     = parquet.value.use_vectorized_scanner
        }
      }
      dynamic "xml" {
        for_each = file_format.value.xml != null ? [file_format.value.xml] : []
        content {
          compression                = xml.value.compression
          disable_auto_convert       = xml.value.disable_auto_convert
          ignore_utf8_errors         = xml.value.ignore_utf8_errors
          preserve_space             = xml.value.preserve_space
          replace_invalid_characters = xml.value.replace_invalid_characters
          skip_byte_order_mark       = xml.value.skip_byte_order_mark
          strip_outer_element        = xml.value.strip_outer_element
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}


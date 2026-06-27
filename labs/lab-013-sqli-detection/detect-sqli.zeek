# /scripts/detect-sqli.zeek
@load base/protocols/http

redef LogAscii::use_json = T;
redef LogAscii::json_timestamps = JSON::TS_ISO8601;
redef LogAscii::stream_unbuffered = T;

export {
  redef enum Notice::Type += { SQLi_Attempt };
}

event http_request(c: connection, method: string, original_URI: string, unescaped_URI: string, version: string)
  {
  if ( /or.?1.?=.?1.?--/i in original_URI || /or.?1.?=.?1.?--/i in unescaped_URI )
    {
    local msg = fmt("SQLi attempt detected in URI from %s to %s: %s", c$id$orig_h, c$id$resp_h, original_URI);
    NOTICE([$note=SQLi_Attempt, $msg=msg, $conn=c]);
    }
  }

event http_entity_data(c: connection, is_orig: bool, entity_length: count, data: string)
  {
  if ( /or.?1.?=.?1.?--/i in data )
    {
    local msg = fmt("SQLi attempt detected in BODY from %s to %s", c$id$orig_h, c$id$resp_h);
    NOTICE([$note=SQLi_Attempt, $msg=msg, $conn=c]);
    }
  }

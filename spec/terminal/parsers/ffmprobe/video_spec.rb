# frozen_string_literal: true

require 'terminal/parsers/ffmprobe/video'

RSpec.describe Terminal::Parsers::FFMProbe::Video do
  describe '#parse' do
    it 'parse the output of a ffmprobe video metadata' do
      output = described_class.parse(ffmprobe_output)

      expect(output.class).to eq(Hash)
      expect(output[:streams].first[:width]).to eq(1481)
      expect(output[:streams].first[:height]).to eq(740)
      expect(output[:streams].first[:start_time]).to eq('0.030000')
      expect(output[:format][:filename]).to eq('./tmp/teste.webm')
      expect(output[:format][:duration]).to eq('4.949297')
    end
  end
end

def ffmprobe_output
  "{\n\"streams\":[\n{\n\"index\":0,\n\"codec_name\":\"vp8\",\n\"codec_long_name" \
  "\":\"On2VP8\",\n\"profile\":\"0\",\n\"codec_type\":\"video\",\n\"codec_tag_string" \
  "\":\"[0][0][0][0]\",\n\"codec_tag\":\"0x0000\",\n\"width\":1481,\n\"height\":740," \
  "\n\"coded_width\":1481,\n\"coded_height\":740,\n\"closed_captions\":0,\n\"has_b_frames" \
  "\":0,\n\"sample_aspect_ratio\":\"1:1\",\n\"display_aspect_ratio\":\"1481:740" \
  "\",\n\"pix_fmt\":\"yuv420p\",\n\"level\":-99,\n\"color_range\":\"tv\",\n\"color_space" \
  "\":\"bt709\",\n\"color_transfer\":\"bt709\",\n\"color_primaries\":\"bt709\",\n\"field_order" \
  "\":\"progressive\",\n\"refs\":1,\n\"r_frame_rate\":\"1000/1\",\n\"avg_frame_rate" \
  "\":\"0/0\",\n\"time_base\":\"1/1000\",\n\"start_pts\":30,\n\"start_time\":\"" \
  "0.030000\",\n\"disposition\":{\n\"default\":1,\n\"dub\":0,\n\"original\":0,\n\"comment" \
  "\":0,\n\"lyrics\":0,\n\"karaoke\":0,\n\"forced\":0,\n\"hearing_impaired\":0,\n\"" \
  "visual_impaired\":0,\n\"clean_effects\":0,\n\"attached_pic\":0,\n\"timed_thumbnails\":" \
  "0\n},\n\"tags\":{\n\"language\":\"eng\",\n\"title\":\"Video\"\n}\n}\n],\n\"format\":" \
  "{\n\"filename\":\"./tmp/teste.webm\",\n\"nb_streams\":1,\n\"nb_programs\":0,\n\"format_name" \
  "\":\"matroska,webm\",\n\"format_long_name\":\"Matroska/WebM\",\n\"start_time\":\"0.030000" \
  "\",\n\"duration\":\"4.949297\",\n\"size\":\"2818406\",\n\"bit_rate\":\"4555646\",\n\"" \
  "probe_score\":100,\n\"tags\":{\n\"encoder\":\"GStreamermatroskamuxversion1.20.3\",\n\"" \
  "creation_time\":\"2023-12-12T13:33:47.213118Z\"\n}\n}\n}"
end

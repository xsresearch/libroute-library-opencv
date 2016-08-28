require 'open3'
require 'bson'

def handler(params)

  cmd = 'runopencv'
  out = ''
  err = ''

  Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
    stdin.write params['stdin'].data
    stdin.close
    out = stdout.read
    err = stderr.read
  end

  h = Hash.new
  h['stdout'] = BSON::Binary.new(out)
  return h

end

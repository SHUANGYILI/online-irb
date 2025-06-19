class TerminalController < ApplicationController
  TIMEOUT = 5

  def index
    @output = nil
  end

  def execute
    code = params[:code]
    @output = run_ruby_code(code)
    render :index
  end

  private

  def run_ruby_code(code)
    output = ""
    result = ""
    original_stdout = $stdout
    stdout_io = StringIO.new

    begin
      $stdout = stdout_io
      Timeout.timeout(TIMEOUT) do
        value = eval(code, TOPLEVEL_BINDING)
        result = "=> #{value.inspect}"
      end
    rescue Timeout::Error
      result = "TimeoutError: Execution took more than #{TIMEOUT}s"
    rescue Exception => e
      result = "#{e.class}: #{e.message}"
    ensure
      $stdout = original_stdout
      output = stdout_io.string
    end

    "#{output}#{output.empty? ? '' : "\n"}#{result}"
  end
end

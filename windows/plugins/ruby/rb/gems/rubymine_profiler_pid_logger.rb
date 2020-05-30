if ENV['RM_PROFILER_PID_FILE'] && ENV['RM_PROFILER_RAW_DATA_FILE']
  File.open(ENV['RM_PROFILER_PID_FILE'], 'w') { |file| file.write(Process.pid) }

  until File.file?(ENV['RM_PROFILER_RAW_DATA_FILE'])
    sleep 0.01
  end
  sleep 1
else
  if ENV['RM_PROFILER_PID_FILE'].nil?
    puts 'Fatal error while starting profiler: no RM_PROFILER_PID_FILE environment variable'
  end

  if ENV['RM_PROFILER_RAW_DATA_FILE'].nil?
      puts 'Fatal error while starting profiler: no RM_PROFILER_RAW_DATA_FILE environment variable'
  end
end
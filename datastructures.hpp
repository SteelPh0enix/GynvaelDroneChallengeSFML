#pragma once
#include <array>
#include <map>
#include <string>
#include <sstream>

enum class Direction { East = 0, West, South, North };

struct DroneData {
  struct {
    int x, y;
  } position;

  std::array<double, 36> scans;
  std::map<Direction, std::string> files;

  DroneData() {}
  DroneData(const std::string& rawData) { fromString(rawData); }

  void fromString(const std::string& rawData) {
    std::stringstream ss(rawData);
    std::string line;
    unsigned int lineNumber = 0;
    while (std::getline(ss, line, '\n')) {
      ++lineNumber;
      if (lineNumber == 1)
        continue;
      else if (lineNumber == 2)
        position = {std::stoi(line.substr(0, line.find_first_of(' '))),
                    std::stoi(line.substr(line.find_first_of(' ') + 1))};
      else if (lineNumber >= 3 && lineNumber <= 38)
        scans[lineNumber - 3] = std::stod(line);
      else if (lineNumber >= 39)
        files[static_cast<Direction>(lineNumber - 39)] =
            line.substr(line.find_first_of(' ') + 1);
    }
  }
};

#OSX
#brew install openmpi
CXX = /usr/local/Cellar/gcc/6.2.0/bin/g++-6
CXXFLAGS = -I/usr/local/include/ -I/usr/local/Cellar/gcc/6.2.0/lib/gcc/6/gcc/x86_64-apple-darwin14.5.0/6.2.0/include -I/usr/include -Wall -O3 -std=c++0x -march=native

# comment the following flags if you do not want to use OpenMP
DFLAG += -DUSEOMP
CXXFLAGS += -fopenmp

all: ffm-train ffm-predict

ffm-train: ffm-train.cpp ffm.o
	$(CXX) $(CXXFLAGS) -o $@ $^

ffm-predict: ffm-predict.cpp ffm.o
	$(CXX) $(CXXFLAGS) -o $@ $^

ffm.o: ffm.cpp ffm.h
	$(CXX) $(CXXFLAGS) $(DFLAG) -c -o $@ $<

clean:
	rm -f ffm-train ffm-predict ffm.o

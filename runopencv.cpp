#include <iostream>

#include <opencv2/highgui/highgui.hpp>
#include <opencv2/core/core.hpp>
#include <opencv/cv.hpp>

using namespace cv;
using namespace std;

int main( int argc, char** argv )
{

// Read stdin into memory
int N = 0;
int n = 0;
char state = 0;
int MAXSIZE = 10*1024*1024;
char* buffer = new char[MAXSIZE];
while (true) // not necessary in current implementation - only supports images up to MAXSIZE bytes
{
  cin.read(buffer, MAXSIZE);
  n = cin.gcount();
  N += n;
  if ( cin.eof() )
    break;
  else
    return 1; // Currently only supports images up to MAXSIZE bytes
}

// Import image
Mat rawData = Mat( 1, N, CV_8UC1, buffer );
Mat m = imdecode(rawData, -1);

// Process image - edge detection
Mat m_g, m_e;
cvtColor(m, m_g, CV_BGR2GRAY);
Canny( m_g, m_e, 50, 150, 3);

Mat m_out = m_e;

// Export image
std::vector<unsigned char> buffer_out;
bool result = imencode(".jpg", m_e, buffer_out);

char* c = (char*)&buffer_out[0];
cout.write(c, buffer_out.size());

return 0;
}

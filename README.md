# riemann-docker
Docker image for riemann based on the one at: https://github.com/patrickod/riemann-docker. This installed riemann 0.2.12 and riemann-dash

# Example build:

docker build -t looprock/riemann-dash .

# Usage

docker run -d -p 4567:4567 looprock/riemann-dash

next, point your browser at: http://localhost:4567/

set(CMAKE_C_COMPILER /usr/bin/gcc)
set(CMAKE_CPP_COMPILER /usr/bin/g++)
set(MPI_C_COMPILER "/home/ryan/spack/opt/spack/linux-ubuntu20.04-x86_64/gcc-9.3.0/openmpi-3.1.4-7yf3znegpwmko4b42nadz36ixq324naq/bin/mpicc")
set(MPI_CXX_COMPILER "/home/ryan/spack/opt/spack/linux-ubuntu20.04-x86_64/gcc-9.3.0/openmpi-3.1.4-7yf3znegpwmko4b42nadz36ixq324naq/bin/mpicxx")
set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
set(BUILD_TESTING TRUE)
set(CMAKE_PREFIX_PATH /home/ryan/programs)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DOMPI_SKIP_MPICXX")
set(CMAKE_CXX_STANDARD 17)
set(ENABLE_SCALAPACK ON)
set(MKLROOT $ENV{MKLROOT})
set(BLAS_LIBRARIES "-L${MKLROOT}/lib/intel64 -Wl,--no-as-needed -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm -ldl")
set(LAPACK_LIBRARIES "${BLAS_LIBRARIES}")
set(LAPACK_INCLUDE_DIRS "${MKLROOT}/include")
set(SCALAPACK_LIBRARIES  -L${MKLROOT}/lib/intel64 -Wl,--no-as-needed -lmkl_scalapack_lp64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lmkl_blacs_openmpi_lp64 -lpthread -lm -ldl)
set(blacs_LIBRARIES ${SCALAPACK_LIBRARIES})
set(scalapack_LIBRARIES ${SCALAPACK_LIBRARIES})
set(lapack_LIBRARIES ${LAPACK_LIBRARIES})
set(FETCHCONTENT_SOURCE_DIR_TILEDARRY /home/ryan/CLionProjects/tiledarray)
set(FETCHCONTENT_SOURCE_DIR_LIBCHEMIST /home/ryan/CLionProjects/LibChemist)
set(FETCHCONTENT_SOURCE_DIR_SDE /home/ryan/CLionProjects/SDE)
set(FETCHCONTENT_SOURCE_DIR_PROPERTY_TYPES /home/ryan/CLionProjects/PropertyTypes)
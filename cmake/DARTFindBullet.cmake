# Copyright (c) 2011-2024, The DART development contributors
# All rights reserved.
#
# The list of contributors can be found at:
#   https://github.com/dartsim/dart/blob/main/LICENSE
#
# This file is provided under the "BSD-style" License

# Bullet. Force MODULE mode to use the FindBullet.cmake file distributed with
# CMake. Otherwise, we may end up using the BulletConfig.cmake file distributed
# with Bullet, which uses relative paths and may break transitive dependencies.
find_package(Bullet COMPONENTS BulletMath BulletCollision MODULE QUIET)

if((BULLET_FOUND OR Bullet_FOUND) AND NOT TARGET Bullet)
  add_library(Bullet INTERFACE IMPORTED)
  if(CMAKE_VERSION VERSION_LESS 3.11)
    set_target_properties(Bullet PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${BULLET_INCLUDE_DIRS}"
      INTERFACE_LINK_LIBRARIES "${BULLET_LIBRARIES}"
    )
  else()
    target_include_directories(Bullet INTERFACE ${BULLET_INCLUDE_DIRS})
    target_link_libraries(Bullet INTERFACE ${BULLET_LIBRARIES})
  endif()
endif()

# PXM

[![Build Status](https://travis-ci.org/pmargreff/pxm.svg?branch=master)](https://travis-ci.org/pmargreff/pxm)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3992b10867404721b3d811176f827e15)](https://app.codacy.com/app/pmargreff/pxm?utm_source=github.com&utm_medium=referral&utm_content=pmargreff/pxm&utm_campaign=Badge_Grade_Dashboard)
[![codecov](https://codecov.io/gh/pmargreff/pxm/branch/master/graph/badge.svg)](https://codecov.io/gh/pmargreff/pxm)

PXM is a simple tool to generate images from ppm family to allow simple and not optimized image manipulation.

## Features

Using the package you should be able to read, create, edit and save images using ppm ASCII format (P1, P2 and P3 types).

## Limitations

On current time this package has no capabilities to read binary format allowed by ppm images (P4, P5 and P6 types).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `paint_easy` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:paint_easy, "~> 0.1.0"}
  ]
end
```

Documentation can be found at [https://hexdocs.pm/pxm](https://hexdocs.pm/pxm).

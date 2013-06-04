#!/bin/bash

source config

# Clean build directory.
rm -rf ./$build_dir/*

# Iterate through front card groups.
for card_group_dir in $front_cards_dir/*; do
  card_group=$(basename $card_group_dir)
  if [[ "$card_group" != "__"* ]]; then

    echo "Processing card group: $card_group"

    # Create group directory in build.
    mkdir "$build_dir/$card_group"

    # Add the format overlay to the card background and save it to build.
    composite "$back_cards_dir/overlay.png" "$back_cards_dir/$card_group.png" "$build_dir/$card_group/0-back.png"

    # Iterate through card types of this group.
    card_counter=0
    for card_type_dir in $front_cards_dir/$card_group/*; do
      card_type=$(basename $card_type_dir)
      if [[ "$card_type" != "__"* ]]; then

        echo "  Processing card type: $card_type"

        # Iterate through the card images of this type.
        for card_file in $front_cards_dir/$card_group/$card_type/*; do
          card_file_name=$(basename "$card_file")
          card_layout="${card_file_name%-*}"
          if [[ "$card_file_name" != "__"* ]]; then
            card_counter=$[$card_counter+1]

            echo "    Processing card image: $card_file"

            # Move card to build directory.
            cp $card_file "$build_dir/$card_group/$card_counter-$card_type-$card_file_name.png"

            # Composite layout for this card.
            if [[ -f $front_cards_dir/$card_group/$card_type/__layout/$card_file_name ]]; then
              composite $front_cards_dir/$card_group/$card_type/__layout/$card_file_name "$build_dir/$card_group/$card_counter-$card_type-$card_file_name.png" "$build_dir/$card_group/$card_counter-$card_type-$card_file_name.png"
            fi
            if [[ -f $front_cards_dir/$card_group/$card_type/__layout/$card_layout.png ]]; then
              composite $front_cards_dir/$card_group/$card_type/__layout/$card_layout.png "$build_dir/$card_group/$card_counter-$card_type-$card_file_name.png" "$build_dir/$card_group/$card_counter-$card_type-$card_file_name.png"
            fi

            # Composite layout for this card type.
            if [[ -f $front_cards_dir/$card_group/__layout/$card_type.png ]]; then
              composite "$front_cards_dir/$card_group/__layout/$card_type.png" "$build_dir/$card_group/$card_counter-$card_type-$card_file_name.png" "$build_dir/$card_group/$card_counter-$card_type-$card_file_name.png"
            fi

          fi
        done

      fi
    done


  fi
done
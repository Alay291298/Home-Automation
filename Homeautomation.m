% Define the components and their labels
components = {'Node MCU (ESP8266)', 'Bluetooth/Wi-Fi Module', 'Relay 1 (TV)', ...
    'Relay 2 (Lights)', 'Relay 3 (Microwave)', 'Relay 4 (Fan)', ...
    'Relay 5 (AC)', 'Custom PCB', 'Power Supply'};
positions = [2 8; 8 8; 2 4; 4 4; 6 4; 8 4; 10 4; 5 2; 0 5];

% Create figure
figure('Position', [100, 100, 1000, 600]);

% Plot the components
hold on;
for i = 1:length(components)
    text(positions(i,1), positions(i,2), components{i}, 'FontSize', 12, ...
        'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', ...
        'BackgroundColor', 'lightblue', 'EdgeColor', 'black', ...
        'Margin', 5);
    plot(positions(i,1), positions(i,2), 'ko', 'MarkerFaceColor', 'k'); % Plot connection points
end

% Define the connections between components
connections = { 'Node MCU (ESP8266)', 'Relay 1 (TV)'; ...
    'Node MCU (ESP8266)', 'Relay 2 (Lights)'; ...
    'Node MCU (ESP8266)', 'Relay 3 (Microwave)'; ...
    'Node MCU (ESP8266)', 'Relay 4 (Fan)'; ...
    'Node MCU (ESP8266)', 'Relay 5 (AC)'; ...
    'Node MCU (ESP8266)', 'Bluetooth/Wi-Fi Module'; ...
    'Node MCU (ESP8266)', 'Custom PCB'; ...
    'Power Supply', 'Node MCU (ESP8266)'; ...
    'Power Supply', 'Custom PCB' };

% Draw the connection lines
for i = 1:size(connections, 1)
    comp1 = connections{i, 1};
    comp2 = connections{i, 2};
    [x1, y1] = deal(positions(strcmp(components, comp1), :));
    [x2, y2] = deal(positions(strcmp(components, comp2), :));
    plot([x1(1) x2(1)], [y1(2) y2(2)], 'k--');
end

% Set axis limits and title
xlim([-1 11]);
ylim([0 10]);
title('Pin Diagram for Home Automation Device', 'FontSize', 14);


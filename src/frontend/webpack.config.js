const path = require('path');

module.exports = {
    entry: {
        auth: './src/auth.ts'
    },
    watch: true,
    devtool: 'inline-source-map',
    module: {
        rules: [
            {

                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: [
                    path.resolve(__dirname, 'node_modules'),
                    path.resolve(__dirname, 'public'),
                    path.resolve(__dirname, 'vue')
                ],
            },
        ],
    },
    resolve: {
        extensions: ['.tsx', '.ts', '.js'],
    },
    output: {
        filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'public/js'),
    },
};